/*
 * JBoss, Home of Professional Open Source
 * Copyright 2014, Red Hat, Inc. and/or its affiliates, and individual
 * contributors by the @authors tag. See the copyright.txt in the
 * distribution for a full listing of individual contributors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.redhat.rhforum.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.redhat.rhforum.data.WinnerDao;
import com.redhat.rhforum.dto.UserRHForum;
import com.redhat.rhforum.model.Winner;

@Controller
@RequestMapping("/rest/winners")
public class MainRestController {
	@Autowired
	private WinnerDao winnerDao;
	public static List<Winner> winners = new ArrayList<Winner>(0);
	
	private static final String URL_PARTICIPANTS = "http://85.190.180.161:8182/cxf/redhat/forum/sorts";

	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<UserRHForum> listAllMembers() {
//		RestTemplate restTemplate = new RestTemplate();
//		UserRHForum[] participants = restTemplate.getForObject(
//				URL_PARTICIPANTS, UserRHForum[].class);
//		return Arrays.asList(participants);
		List<Winner> winnerList =  winnerDao.findAllOrderedById();
		List<UserRHForum> participants = new ArrayList<UserRHForum>(0);
		UserRHForum participant = null;
		for(Winner winner: winnerList){
			participant = new UserRHForum();
			participant.setUser_id(winner.getId());
			participant.setName(winner.getName());
			participants.add(participant);
		}
		return participants;
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody Winner lookupMemberById(@PathVariable("id") Long id) {
		return winnerDao.findById(id);
	}

	@RequestMapping(value = "/add/{winnerName}", method = RequestMethod.POST, headers = "Accept=application/json")
	public @ResponseBody String create(@PathVariable String winnerName) {
	
		Winner newWinner = new Winner();
		newWinner.setName(winnerName);
		winners.add(newWinner);
//		winnerDao.register(newWinner);
		return HttpStatus.CREATED.name();
	}

}
