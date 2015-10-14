<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

    		<!-- Center Wrap BEGIN -->
    		<div class="center-wrap">
    			<div class="center-align">
    				<div class="center-body">
			    		<div class="row">
			    			<div class="col-sm-6 margin-bottom-30">

			    			</div>
			    			<div class="col-sm-6 margin-bottom-30">

			    			</div>
			    		</div>    				
			    		<div class="row">
			    			<div class="col-sm-6 margin-bottom-30">
<!-- BEGIN PORTLET-->
						<div class="portlet light bordered" style="background-color: transparent;">
							<div class="portlet-title">
								<div class="caption caption-md font-red-sunglo">
									<i class="icon-bar-chart theme-font hide"></i>
									<span class="caption-subject theme-font bold uppercase" style="color: white">30 Winners</span>
									
								</div>
							</div>
							<div class="portlet-body">
								<div class="table-scrollable table-scrollable-borderless">
									<table class="table table-hover table-light " style="background-color: transparent;">
									<thead>
									<tr class="uppercase">
										<th>
											 Company
										</th>
										<th>
											 Name
										</th>
									</tr>
									</thead>
									<tbody>
										<c:forEach items="${winnerList}" var="winner">
											<tr>
												<td>
													 ${winner.company}
												</td>
												<td>
													 ${winner.name}
												</td>
											</tr>
										
										</c:forEach>
									</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- END PORTLET-->
			    			</div>

			    			<div class="col-sm-6 margin-bottom-30">
<!-- BEGIN PORTLET-->
						<div class="portlet light bordered" style="background-color: transparent;">
							<div class="portlet-title">
								<div class="caption caption-md font-red-sunglo">
									<i class="icon-bar-chart theme-font hide"></i>
									<span class="caption-subject theme-font bold uppercase" style="color: white">Contest Winners</span>
									
								</div>
							</div>
							<div class="portlet-body">
								<div class="table-scrollable table-scrollable-borderless">
									<table id="winnerTable" class="table table-hover table-light " style="background-color: transparent;">
									<thead>
									<tr class="uppercase">
										<th>
											 Name
										</th>
									</tr>
									</thead>
									<tbody>
										<c:forEach items="${winnerList2}" var="winner">
											<tr>
												<td>
													 ${winner.name}
												</td>
											</tr>
										
										</c:forEach>
									</tbody>

									</table>
								</div>
							</div>
						</div>
						<!-- END PORTLET-->
			    			</div>
			    		</div>
					</div>
				</div>
						<!-- Copyright BEGIN -->
			<p class="copyright">2015 © Red Hat. 
	 			<a href="http://www.redhat.com" title="http://www.redhat.com" target="_blank">Red Hat Forum 2015</a>
	 		</p>
			<!-- Copyright END -->
			
			</div>
			
		<script>
			$( document ).ready(function() {

			});		
			
		</script>			