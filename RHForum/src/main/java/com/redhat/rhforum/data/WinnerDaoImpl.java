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
package com.redhat.rhforum.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.redhat.rhforum.model.Winner;

@Repository
@Transactional
public class WinnerDaoImpl implements WinnerDao {
	@Autowired
	private EntityManager em;

	public Winner findById(Long id) {
		return em.find(Winner.class, id);
	}

	public Winner findByName(String name) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Winner> criteria = cb.createQuery(Winner.class);
		Root<Winner> winner = criteria.from(Winner.class);

		/*
		 * Swap criteria statements if you would like to try out type-safe
		 * criteria queries, a new feature in JPA 2.0
		 * criteria.select(member).orderBy(cb.asc(member.get(Member_.name)));
		 */

		criteria.select(winner).where(cb.equal(winner.get("name"), name));
		return em.createQuery(criteria).getSingleResult();
	}

	public List<Winner> findAllOrderedById() {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Winner> criteria = cb.createQuery(Winner.class);
		Root<Winner> winner = criteria.from(Winner.class);

		/*
		 * Swap criteria statements if you would like to try out type-safe
		 * criteria queries, a new feature in JPA 2.0
		 * criteria.select(member).orderBy(cb.asc(member.get(Member_.name)));
		 */

		criteria.select(winner).orderBy(cb.asc(winner.get("id")));
		return em.createQuery(criteria).getResultList();
	}

	public void register(Winner winner) {
		em.persist(winner);
		return;
	}

	@Override
	public List<Winner> findAllOrderedById(int howMany) {
		List<Winner> list = this.findAllOrderedById();
		List<Winner> finalList = new ArrayList<Winner>(0);

		int counter = 1;
		for (Winner winner : list) {

			finalList.add(winner);

			if (counter == howMany) {
				break;
			}
			counter++;
		}

		return finalList;
	}
}
