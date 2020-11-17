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

===============================================================

Please review for content and accuracy, print onto Company Letterhead, and sign.

[DATE]


Re:	Employment Confirmation Letter for Mr. Nirav Kamleshbhai MISTRY

This letter serves to confirm that Mr. Nirav Kamleshbhai Mistry was employed full-time by Apex Technologies Group, Inc. from July 13, 2012 to January 4, 2019 as a Java Programmer. 

Mr. Mistry’s employment with Apex Technologies Group, Inc. was progressively responsible in that he was accorded greater responsibility and authority over assigned duties during the duration of his employment with our company. Throughout his employment, Mr. Mistry gained engineering experience including development and support of large enterprise Linux servers (including Redhat, AIX and Solaris) and various Windows servers platform; executing shell scripting (korn or bash); with application web hosting platforms (Tomcat, WebLogic, JBoss or WebSphere); with UNIX to Active Directory Bridging services (Centrify Authentication Services); building and supporting the Privilege Access Management (PAM) solutions; writing PowerShell and batch shell scripts; writing MS SQL queries and reporting; and developing and writing Java and Java scripts.

Specifically, while serving as a Java Programmer with Apex Technologies Group, Inc., Mr. Mistry worked with various TDD and BDD using Junit, EasyMock and automated protractor testing for the middleware components and angular based components; created table DDL, PL/SQL stored procedures and complex database objects views, and managed in version control; managed security certificates with multilayered authentication in TLS / HTTPS and PKI environment; used Atlasian integrated with Jira, Confluence, Teamcity automated build, Sonar code coverage, bitbucket, Crucible code review and Agile process; wrote script to extract and migrate users from CA PAM Exceedium Cloakware to Cyberark; developed Java based web service API to communicate with CyberArk PSM and PSMP; configured shell script to elevate users on-demand based on their group and access level either SSH, Pimsu or impersonate the user; created wrapper script and Java API to perform auto login from rdp for Cyberark PSM authenticated users; implemented various securities OASIS Code securities for Java based code, cross site scripting, SQL injection and vulnerabilities; configured various monitoring scripts in iCinga (Nagios) which performed disk space, application log, cluster syncing, password update request; and developed  angular js based single page application, used various angular modules, components, routers and promises with java based Spring MVC and developed web based application. 

In addition, Mr. Mistry implemented restful web services with security header handle request from front end authenticated user request; managed agent based opswise scheduler on large scaled all Unix environments, used Powershell scripts; used MS Visio to create diagrams to support documents; participated in daily stand ups to report daily tasks and achievements as well as identified any impediments for the project’s progress; managed all SDLC documents using Sharepoint to centralize the documents storage and collaborated with all team members; implemented CA IDP Portal Workflow and Taskflow to provision and deprovision user access using CA IAM and CA IAM Tools; implemented Federated Identity access with various enterprise based organization and trust security via secured encrypted protocols; integrated and managed Change Management / Incident management /Problem management systems HPSM and Service now with CMDB, PAM and Centrify system; and analyzed and coordinated business activities and operational resources for various large scale projects using business analysis, systems analysis, BRD, FRD, Agile, SharePoint, Visio, QC and MS Project.

I, Sarvesh Kumar Dharayan serve as President of Apex Technologies Group, Inc. This position enables me to accurately comment on Mr. Mistry’s employment with Apex Technologies Group, Inc. during the abovementioned period. Should you require any further information pertaining to Mr. Mistry’s employment, please do not hesitate to contact me directly. 

Very truly yours, 


Sarvesh Kumar Dharayan 
President 
Apex Technologies Group, Inc.

