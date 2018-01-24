https://info.ssh.com/tectia-server-trial-downloads?submissionGuid=6cc0704c-1aa0-4f8d-a582-7402db351c1d

List<int[]> pairs =
numbers1.stream()
.flatMap(i -> numbers2.stream()
.map(j -> new int[]{i, j})
)
.collect(toList());

=====
List<int[]> pairs =
numbers1.stream()
.flatMap(i ->
numbers2.stream()
.filter(j -> (i + j) % 3 == 0)
.map(j -> new int[]{i, j})
)
.collect(toList());

====================
List<Integer> numbers1 = Arrays.asList(1, 2, 3, 4, 5, 6);
List<Integer> numbers2 = Arrays.asList(1, 2, 3, 4, 5, 6);
List<int[]> pairs =
numbers1.stream()
.flatMap(i -> numbers2.stream()
.map(j -> new int[]{i, j})
)

List<Integer> numbers1 = Arrays.asList(1, 2, 3, 4, 5, 6);
List<Integer> numbers2 = (ArrayList<Integer>) numbers1.clone();

numbers1.stream()
.flatMap(i ->
numbers2.stream()
.filter(j -> (i + j) == 7)
.map(j -> new int[]{i, j})
)

========================
Anagrams
========================
import java.util.Arrays;
import java.util.HashMap;
import java.util.function.BiConsumer;
import java.util.function.ObjIntConsumer;
import java.util.function.Supplier;
public class LambdaDetector implements AnagramDetector {
 
  private static final int MAX_VALUE = 65280;
 
  @Override
  public boolean isAnagram(String input1, String input2) {
 
     // null and length checks omitted for brevity
     Supplier<Long[]> start = () -> { 
		 Long[] a = new Long[MAX_VALUE]; 
		 Arrays.fill(a, 0L); 
		 return a; 
	 };
     ObjIntConsumer<Long[]> accumulator = (map, number) -> { 
		map[number]++; 
	 };
	 
     BiConsumer<Long[],Long[]> combiner = (map1, map2) -> {  };
 
     return Arrays.equals( input1.chars().collect(start, accumulate, combine),
                           input2.chars().collect(start, accumulate, combine));
 
  }
 
}
=======================

import java.util.*;

public class Anagrams {
  private static Map<String, List<String>> anagramsMap = new HashMap<>(100);
  
  public static void main(String[] args){
    String[] input = {"akka", "akak", "baba", "bbaa" };
	for(String : input)
	{
	  char[] word = s.toCharArray();
	  Arrays.sort(word);
	  String key = String.valueOf(word);
	  if(!anagramsMap.containsKey(key)
	  {
	    anagramsMap.put(key,new ArrayList<String>());
	  }
	  anagramsMap.get(key).add(s);
	}
	System.out.println("anagramsMap = "+ anagramsMap);
  } 
}

=========================

package com.mkyong.java8;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class TestReadFile2 {

	public static void main(String args[]) {

		String fileName = "c://lines.txt";
		List<String> list = new ArrayList<>();

		try (Stream<String> stream = Files.lines(Paths.get(fileName))) {

			list = stream
					.filter(line -> !line.startsWith("line3"))
					.map(String::toUpperCase)
					.collect(Collectors.toList());

		} catch (IOException e) {
			e.printStackTrace();
		}
		list.forEach(System.out::println);
	}

}

Stream <String> lines = Files.lines(Paths.get("c:\\demo.txt")).
            map(line -> line.split("[\\s]+")).
            flatMap(Arrays::stream).distinct();
 
            lines.forEach(System.out::println);
            lines.close();
