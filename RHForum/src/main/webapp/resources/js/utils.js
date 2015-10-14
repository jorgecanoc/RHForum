function blockPage() {
	$('body').append('<div id="loading"></div>');
	$('#loading').fadeIn();
}
function unblockPage() {
	$('#loading').fadeOut();
}
function sendRequestAjax(action, targetId, after, method, formId) {

	var innerMethod = method == null ? "GET" : method;
	var path = context + '/' + action;
	var frm = $('#' + formId);

	blockPage();

	$
			.ajax({
				type : innerMethod,
				url : path,
				data : (frm !== undefined && frm !== null) ? frm
						.serialize(true) : null,
				success : function(data) {
					$('#' + targetId).html("");
					$('#' + targetId).html(data);
				},
				complete : function(jqXHR) {
					if (after !== null) {
						eval(after);
					}
					unblockPage();
				},
				error : function(xhr, ajaxOptions, thrownError) {
					unblockPage();
				}
			})
}
function addWinner(winner) {
	$.ajax({
		type : "POST",
		async : true,
		cache : false,
		url : context + "/rest/winners/add/" +winner,
		crossDomain: true,		
		success : function(data) {

		}
	})
}




var map = new Object();
var MAX_PARTICIPANTS = 1000;
var URL_SORT="http://85.190.180.161:8182/cxf/redhat/forum/sorts";


function waitForWinner() {
	$.ajax({
		type : "GET",
		async : true,
		cache : false,
		url : context + "/rest/winners",
		crossDomain: true,		
		success : function(data) {
			
			console.log(data);
			
			var json = eval(data);
			console.log(json);
			
			var count = Object.keys(json).length
			// Actualizar informacion
			$('#counter').text(count);
			$.each(json, function(key, value) {
				// console.log(value.id, value.name);
				// console.log(!map.hasOwnProperty(value.id));
				if (value.user_id !== null || value.user_id !== '') {
					if (!map.hasOwnProperty(value.user_id)) {
						$('#participants').text(count);
						map[value.user_id] = value.name;
					}
				}
			});
			if (Object.keys(map).length >= MAX_PARTICIPANTS) {
				start();
			} else {
				setTimeout('waitForWinner()', 50000);
			}

		},
		error : function(xhr, ajaxOptions, thrownError) {
			setTimeout('waitForWinner()', 50000);
		}
	})
}

var table = [];

var camera, scene, renderer;
var controls;
var mesh1;

var objects = [];
var targets = {
	table : [],
	sphere : [],
	helix : [],
	grid : []
};

function start() {

	// console.log(map);

	// prepare table;
	var row = 1;
	var column = 0;

	for ( var k in map) {
		if (map.hasOwnProperty(k)) {
			column++;
			// console.log(k);
			// console.log(map[k]);
			table.push(k);
			table.push(map[k]);
			table.push(map[k]);
			table.push(column);
			table.push(row);

			if (column == 8) {
				row++;
				column = 0;
			}

		}

	}
	// console.log(table);

	init();

	animate();

	$('div .element').on('mouseenter', function() {
		var div = $(this);
		div.stop(true, true).animate({
			margin : -10,
			width : "+=80",
			height : "+=80"
		}, 'fast');
	}).on('mouseleave', function() {
		var div = $(this);
		div.stop(true, true).animate({
			margin : 0,
			width : "-=80",
			height : "-=80"
		}, 'fast');	
	})

}

function init() {

	camera = new THREE.PerspectiveCamera(45, .30, 1, 10000);

	camera.position.z = 2100;

	scene = new THREE.Scene();

	// table

	for (var i = 0; i < table.length; i += 5) {

		var element = document.createElement('div');
		element.className = 'element';
		element.id = table[i];
//		element.onclick = function() {
//
//			alert("Hola Mundo");
//		};

		element.style.backgroundColor = 'rgba(215, 40, 40,'
				+ (Math.random() * 0.5 + 0.25) + ')';

		var number = document.createElement('div');
		number.className = 'number';
		number.textContent = (i / 5) + 1;
		element.appendChild(number);

		var symbol = document.createElement('div');
		symbol.className = 'symbol';
		symbol.textContent = table[i];
		element.appendChild(symbol);

		var details = document.createElement('div');
		details.className = 'details';
		details.innerHTML = table[i + 1];
		element.appendChild(details);

		var object = new THREE.CSS3DObject(element);
		object.position.x = Math.random() * 3000 - 1000;
		object.position.y = Math.random() * 3000 - 1000;
		object.position.z = Math.random() * 3000 - 1000;
		scene.add(object);

		objects.push(object);

		//

		var object = new THREE.Object3D();
		object.position.x = (table[i + 3] * 140) - 1330;
		object.position.y = -(table[i + 4] * 180) + 990;

		targets.table.push(object);

	}

	// sphere

	var vector = new THREE.Vector3();

	for (var i = 0, l = objects.length; i < l; i++) {

		var phi = Math.acos(-1 + (2 * i) / l);
		var theta = Math.sqrt(l * Math.PI) * phi;

		var object = new THREE.Object3D();

		object.position.x = 800 * Math.cos(theta) * Math.sin(phi);
		object.position.y = 800 * Math.sin(theta) * Math.sin(phi);
		object.position.z = 800 * Math.cos(phi);

		vector.copy(object.position).multiplyScalar(2);

		object.lookAt(vector);

		targets.sphere.push(object);

	}

	// helix

	var vector = new THREE.Vector3();

	for (var i = 0, l = objects.length; i < l; i++) {

		var phi = i * 0.175 + Math.PI;

		var object = new THREE.Object3D();

		object.position.x = 600 * Math.sin(phi);
		object.position.y = -(i * 8) + 450;
		object.position.z = 600 * Math.cos(phi);

		vector.x = object.position.x * 2;
		vector.y = object.position.y;
		vector.z = object.position.z * 2;

		object.lookAt(vector);

		targets.helix.push(object);

	}

	// grid

	for (var i = 0; i < objects.length; i++) {

		var object = new THREE.Object3D();

		object.position.x = ((i % 5) * 400) - 800;
		object.position.y = (-(Math.floor(i / 5) % 5) * 400) + 800;
		object.position.z = (Math.floor(i / 25)) * 1000 - 2000;

		targets.grid.push(object);

	}

	//

	renderer = new THREE.CSS3DRenderer();
	renderer.setSize(window.innerWidth, window.innerHeight);
	renderer.domElement.style.position = 'absolute';
	document.getElementById('containerWinner').appendChild(renderer.domElement);

	//

	controls = new THREE.TrackballControls(camera, renderer.domElement);
	controls.rotateSpeed = 0.5;
	controls.minDistance = 500;
	controls.maxDistance = 6000;
	controls.addEventListener('change', render);

	transform(targets.sphere, 3000);

	window.addEventListener('resize', onWindowResize, false);

}

function transform(targets, duration) {

	TWEEN.removeAll();

	for (var i = 0; i < objects.length; i++) {

		var object = objects[i];
		var target = targets[i];

		new TWEEN.Tween(object.position).to({
			x : target.position.x,
			y : target.position.y,
			z : target.position.z
		}, Math.random() * duration + duration).easing(
				TWEEN.Easing.Exponential.InOut).start();

		new TWEEN.Tween(object.rotation).to({
			x : target.rotation.x,
			y : target.rotation.y,
			z : target.rotation.z
		}, Math.random() * duration + duration).easing(
				TWEEN.Easing.Exponential.InOut).start();

	}

	new TWEEN.Tween(this).to({}, duration * 2).onUpdate(render).start();

}

function onWindowResize() {

	camera.aspect = window.innerWidth / window.innerHeight;
	camera.updateProjectionMatrix();

	renderer.setSize(window.innerWidth, window.innerHeight);

	render();

}

function animate() {

	requestAnimationFrame(animate);

	TWEEN.update();

	controls.update();

}

function render() {

	renderer.render(scene, camera);

}

function startContest() {
	$('#containerWinner').html("");
	table = [];
	MAX_PARTICIPANTS = 1000;
	
	start();
	
	setTimeout( function (){
		// Inicia Concurso, arma la tabla con los concursantes
		transform(targets.helix, 2000);
		
	    setTimeout(function () {
	    	var total = Object.keys(map).length,
	        selected = 0;

	        setTimeout(realContest,total * 160);

	    	// Inicia barrido de todos los elementos solo efector visual
	    	for (var k in map) {
	    		selected = Math.floor( Math.random() * total );	
	    		setEfect(selected,map[selected], 150);
	    	}

	    }, 3000);
		
		
	}, 4000);
	
}

function realContest(){
	var total = Object.keys(map).length,
    selected = 0;
    
	selected = Math.floor( Math.random() * total );
	
    for(var k in map){
    	setEfect(k,map[k], 100);
    	if(eval(k)== selected){
    		addWinner( k + " " + map[k]);
    		console.log("GANADOR ======>" + k);
    		break;
    	}
    }
	
}

function setEfect(k, value, timeout){
	console.log(k + " ======> " + value);

	setTimeout((function(k) {
		return function() {
			$('#'+k).animate({
				margin : -10,
				width : "+=80",
				height : "+=80"
			}, 'fast');
			$('#counter').text(k);			
			$('#winnerName').text(value);
			$('#'+k).animate({
				margin : -10,
				width : "-=80",
				height : "-=80"
			}, 'fast');
		};
	}(k)), k * timeout);
	
}