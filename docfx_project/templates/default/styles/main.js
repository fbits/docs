// Copyright (c) Microsoft. All rights reserved. Licensed under the MIT license. See LICENSE file in the project root for full license information.
//window.onload = getLastUpdateDate;
//window.onload = getContributors;
//window.onload = readingTime;

function changeCSS() {
	var theme = document.getElementById('theme').value
	document.getElementById('style').setAttribute('href', theme);
}

window.addEventListener('load', function() {
	var path = window.location.pathname;

	var pathSplit = path.split("/");
	var file = '';
	if (pathSplit[1] === "Docfx"){
		pathSplit.splice(0,2);
		file = pathSplit.join("/").split(".").shift();
	}
	else {
		file = path.split(".").shift();
	}

	console.log(path);

	var request = new XMLHttpRequest();

    request.open('GET', 'https://api.github.com/repos/carolinesena/Docfx/commits?path=docfx_project' + file + '.md', true);
    request.onload = function () {
        var data = JSON.parse(this.response);

        if (request.status >= 200 && request.status < 400) {
			//console.log(data[0].commit.author.date);
			console.log(data);
			document.getElementById("last-update").innerHTML = data[0].commit.author.date.split("T").shift();
        } else {
            console.log('error');
        }
    }

    request.send();
});

window.addEventListener('load', function() {
	var content = document.body.innerHTML;
	var doc = new DOMParser().parseFromString(content, 'text/html');
	var contentFiltered = content.replace(/(^|>)[ \n\t]+/g, ">").replace(/<[^>]*>?/gm, ' ').replace(/\s{2,}/g, ' ');

	var count = contentFiltered.split(/[ ]/).length;

	var time = Math.ceil(count/200);

	document.getElementById("time").innerHTML = time + (time === 1 ? " minuto" : " minutos");
});

window.addEventListener('load', function() {
	var path = window.location.pathname;
	var page = path.split("/").pop();
	var file = path.split(".").shift();
	console.log(path);
	console.log( page );

	var request = new XMLHttpRequest()

	var list = document.createElement('ul');
	list.setAttribute("class", "contributors");

	contributors_list = [];

    request.open('GET', 'https://api.github.com/repos/carolinesena/Docfx/commits?path=docfx_project' + file + '.md', true)
    request.onload = function () {
        var data = JSON.parse(this.response);

        if (request.status >= 200 && request.status < 400) {
			data.forEach(function (d) {

				if (!contributors_list.includes(d.author.login) ){
					contributors_list.push(d.author.login);
					console.log(d.committer.login);
					var item = document.createElement('li');
					
					var img = document.createElement("img");
					img.setAttribute("src", d.author.avatar_url);

					item.appendChild(img);
					list.appendChild(item);
				}

			});
			
        } else {
			console.log('error');
		}
		
    }

	request.send();
	
	var listContrib = document.getElementById('contributors');
	listContrib.setAttribute("href", 'https://github.com/carolinesena/Docfx/tree/master/docfx_project' + file + '.md');
	listContrib.appendChild(list);
});

