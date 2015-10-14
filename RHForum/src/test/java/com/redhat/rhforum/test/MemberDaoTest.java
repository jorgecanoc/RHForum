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
package com.redhat.rhforum.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.redhat.rhforum.data.WinnerDao;
import com.redhat.rhforum.model.Winner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:test-context.xml",
		"classpath:/META-INF/spring/applicationContext.xml" })
@Transactional
@TransactionConfiguration(defaultRollback = true)
public class MemberDaoTest {
	@Autowired
	private WinnerDao winnerDao;

	@Test
	public void testFindById() {
		Winner winner = winnerDao.findById(0l);

		assertEquals("John Smith", winner.getName());

		return;
	}

	@Test
	public void testFindByEmail() {
		Winner winner = winnerDao.findByName("John Smith");

		assertEquals("John Smith", winner.getName());
		return;
	}

	@Test
	public void testRegister() {
		Winner winner = new Winner();
		winner.setName("Jane Doe");

		winnerDao.register(winner);
		Long id = winner.getId();
		assertNotNull(id);

		assertEquals(2, winnerDao.findAllOrderedById().size());
		Winner newWinner = winnerDao.findById(id);

		assertEquals("Jane Doe", newWinner.getName());
		return;
	}

	@Test
	public void testFindAllOrderedByName() {
		Winner winner = new Winner();
		winner.setName("Jane Doe");
		winnerDao.register(winner);

		List<Winner> winners = winnerDao.findAllOrderedById();
		assertEquals(2, winners.size());
		Winner newWinner = winners.get(0);

		assertEquals("Jane Doe", newWinner.getName());
		return;
	}
}
