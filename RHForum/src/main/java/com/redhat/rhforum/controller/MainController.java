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

import java.util.Arrays;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.UnexpectedRollbackException;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.redhat.rhforum.data.WinnerDao;
import com.redhat.rhforum.dto.UserRHForum;
import com.redhat.rhforum.model.Winner;

@Controller
@RequestMapping(value = "/")
public class MainController {
	@Autowired
	private WinnerDao winnerDao;

	private static final String URL_WINNERS = "http://85.190.180.161:8182/cxf/redhat/forum/awards";

	
	@RequestMapping(method = RequestMethod.GET)
	public String main(Model model) {
		return "start";
	}

	@RequestMapping(value = "start",method = RequestMethod.GET)
	public String start(Model model) {
		return "start";
	}
	
	@RequestMapping(value = "pickWinner", method = RequestMethod.GET)
	public String pickAWinner() {
		return "pickWinner";
	}

	@RequestMapping(value = "dashboard", method = RequestMethod.GET)
	public String dashboard(Model model) {
//		RestTemplate restTemplate = new RestTemplate();
//		UserRHForum[] winners = restTemplate.getForObject(
//				URL_WINNERS, UserRHForum[].class);
		
		//Obtiene la lista de los ultimos 10 participantes para concurso 1
		model.addAttribute("winnerList", null);
		
		//Obtiene la lista de los ultimos 10 participantes para concurso 2		
		model.addAttribute("winnerList2", MainRestController.winners);
		
		return "dashboard";
	}	
	@RequestMapping(method = RequestMethod.POST)
	public String registerNewMember(
			@Valid @ModelAttribute("newWinner") Winner newWinner,
			BindingResult result, Model model) {
		if (!result.hasErrors()) {
			try {
				winnerDao.register(newWinner);
				return "redirect:/";
			} catch (UnexpectedRollbackException e) {
				model.addAttribute("winners", winnerDao.findAllOrderedById());
				model.addAttribute("error", e.getCause().getCause());
				return "index";
			}
		} else {
			model.addAttribute("winners", winnerDao.findAllOrderedById());
			return "index";
		}
	}
}
