// Copyright (c) Microsoft. All rights reserved. Licensed under the MIT license. See LICENSE file in the project root for full license information.

/**************************************************************************************************
	Salva localmente qual o último tema utilizado para manter a aparência na mudança da páginas e
	quando há refresh da página.
***************************************************************************************************/
function changeCSS(theme) {
	//var theme = document.getElementById('theme').value
	document.getElementById('style').setAttribute('href', theme);
	localStorage.setItem('current-theme', theme.split('/').pop());
}

if (localStorage.getItem('current-theme') === 'main_dark.css'){

	var script = document.currentScript;
	var fullUrl = script.src.replace(location.origin, '').split('/');
	var jsFile = fullUrl.pop();
	var cssPath = fullUrl.join("/");
	document.getElementById('style').setAttribute('href', cssPath + '/main_dark.css');
}

/**************************************************************************************************
	Obtém o caminho do arquivo referente à página atual; após isso chama as funções que obtêm
	a última data de atualização e os contribuidores.
***************************************************************************************************/
window.addEventListener('load', function() {
	var path = window.location.pathname;

	var pathSplit = path.split("/");
	var file = '';
	if (pathSplit[1] === "Docfx"){
		pathSplit.splice(1,1);
		file = pathSplit.join("/").split(".").shift();
	}
	else {
		file = path.split(".").shift();
	}

	var requestDate = new XMLHttpRequest();
	var requestContributors = new XMLHttpRequest();

	getLastUpdateDate(file, requestDate);
	getContributors(file, requestContributors);
    
});

/**************************************************************************************************
	Obtém a data do commit mais recente através da api do github.
***************************************************************************************************/
function getLastUpdateDate(file, request){
	request.open('GET', 'https://api.github.com/repos/carolinesena/Docfx/commits?path=docfx_project' + file + '.md', true);
    request.onload = function () {
        var data = JSON.parse(this.response);

        if (request.status >= 200 && request.status < 400) {
			console.log(data);
			document.getElementById("last-update").innerHTML = data[0].commit.author.date.split("T").shift();
        } else {
            console.log('error');
        }
    }

    request.send();
}

/*************************************************************************************************
	Obtém a lista de contribuidores através do histórico de commits, utilizando a api do github.
**************************************************************************************************/
function getContributors(file, request){
	
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
}

/*************************************************************************************************
	Obtém apenas o texto no body da página, conta o número de palavras e calcula o tempo de 
	leitura, considerando que a velocidade média de leitura é de 200 palavras por minuto.
**************************************************************************************************/
window.addEventListener('load', function() {
	var content = document.body.innerHTML;
	var doc = new DOMParser().parseFromString(content, 'text/html');
	var contentFiltered = content.replace(/(^|>)[ \n\t]+/g, ">").replace(/<[^>]*>?/gm, ' ').replace(/\s{2,}/g, ' ');

	var count = contentFiltered.split(/[ ]/).length;

	var time = Math.ceil(count/200);

	document.getElementById("time").innerHTML = time + (time === 1 ? " minuto para ler" : " minutos para ler");
});
