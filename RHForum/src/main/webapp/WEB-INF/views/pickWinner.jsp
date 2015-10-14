<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

		<style>
			a {
				color: #ffffff;
			}

			#menu {
				position: absolute;
				bottom: 20px;
				width: 100%;
				text-align: center;
			}

			.element {
				width: 120px;
				height: 160px;
				box-shadow: 0px 0px 12px rgba(255,255,255,0.5);
				border: 1px solid rgba(255,255,255,0.25);
				text-align: center;
				cursor: default;
			}

			.element:hover {
				box-shadow: 0px 0px 12px rgba(255,255,255,0.75);
				border: 1px solid rgba(255,255,255,0.75);
			}
				.element .number {
					position: absolute;
					top: 20px;
					right: 20px;
					font-size: 20px;
					color: rgba(255,255,255,0.75);
				}

				.element .symbol {
					position: absolute;
					top: 40px;
					left: 0px;
					right: 0px;
					font-size: 60px;
					font-weight: bold;
					color: rgba(255,255,255,0.75);
					text-shadow: 0 0 10px rgba(255,255,255,0.95);
				}

				.element .details {
					position: absolute;
					bottom: 15px;
					left: 0px;
					right: 0px;
					font-size: 16px;
					color: rgba(255,255,255,0.75);
				}


			.elementWinner {
				width: 240px;
				height: 320px;
				box-shadow: 0px 0px 12px rgba(255,255,255,0.5);
				border: 1px solid rgba(255,255,255,0.25);
				text-align: center;
				cursor: default;
			}

			.elementWinner:hover {
				box-shadow: 0px 0px 12px rgba(255,255,255,0.75);
				border: 1px solid rgba(255,255,255,0.75);
			}
				.elementWinner .number {
					position: absolute;
					top: 20px;
					right: 20px;
					font-size: 18px;
					color: rgba(255,255,255,0.75);
				}

				.elementWinner .symbol {
					position: absolute;
					top: 40px;
					left: 0px;
					right: 0px;
					font-size: 60px;
					font-weight: bold;
					color: rgba(255,255,255,0.75);
					text-shadow: 0 0 10px rgba(255,255,255,0.95);
				}

				.elementWinner .details {
					position: absolute;
					bottom: 15px;
					left: 0px;
					right: 0px;
					font-size: 18px;
					color: rgba(255,255,255,0.75);
				}

			button {
				color: rgba(255,255,255,0.75);
				background: transparent;
				outline: 1px solid rgba(255,255,255,0.75);
				border: 0px;
				padding: 5px 10px;
				cursor: pointer;
			}
			button:hover {
				background-color: rgba(255,255,255,0.5);
			}
			button:active {
				color: #000000;
				background-color: rgba(255,255,255,0.75);
			}
		</style>

	   	<div class="col-sm-6 left-align" style="height: 800px;"  >
			<div id="containerWinner"></div>		
<!-- 			<div id="menu"> -->
<!-- 				<button id="table">Start Contest</button> -->
<!-- 				<button id="sphere">SPHERE</button> -->
<!-- 				<button id="helix">HELIX</button> -->
<!-- 				<button id="grid">GRID</button> -->
<!-- 			</div>	 -->
		</div>	
		<div class="col-sm-6 left-align">
    		<div class="row">
    			<div class="col-sm-3 margin-bottom-30">
    				<a class="webapp-btn">
    					<h3 id="counter">0</h3>
    					<p id="winnerName"></p>
    				</a>
    			</div>
    			<div class="col-sm-9 margin-bottom-30">
    				<a id="table" class="webapp-btn" onclick="startContest();">
    					<h3>Participants <span id="participants"></span></h3>
    					<div id="winnerList"></div>
    				</a>
    			</div>
    		</div>			
		</div>
			<!-- Copyright BEGIN -->
			<p class="copyright">2015 © Red Hat. 
	 			<a href="http://www.redhat.com" title="http://www.redhat.com" target="_blank">Red Hat Forum 2015</a>
	 		</p>
			<!-- Copyright END -->

		<script>
			$( document ).ready(function() {
				waitForWinner();			
			});		
			
		</script>
