let trailerFrame;

let selectedGenres = [];
let downloadLinks = [];

$(document).ready(function(){

    trailerFrame = $(".trailer-frame");
    $(".trailer-link").keyup(changeTrailer);

    $("#add-movie-genre-button").click(editAddGenreButton);
    console.log("aaw");

    // check which genres were selected
    var objects = $(".movie-genre>a");
    for (let genre of objects) {
        genre.addEventListener("click", function () {
            let value = genre.getAttribute("selected");
            if(value === "true"){
                genre.setAttribute("selected", false);
                genre.style.backgroundColor = "";

                selectedGenres = selectedGenres.filter(function (item) {
                    return item != genre.innerHTML;
                });

            } else if(value === "false"){
                genre.setAttribute("selected", true);
                genre.style.backgroundColor = "red";

                selectedGenres.push(genre.innerHTML);

            }
        });
    }

    // add link button
    $("#add-link-button").click(addLink);

    // add movie button
    $('#add-movie-button').click(addMovie);
});

function changeTrailer(params) {
    console.log("awayy");
    let ytID = getId($('.trailer-link').val());
    trailerFrame.attr('src', "https://www.youtube.com/embed/" + ytID);
}

function getId(url) {
    var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
    var match = url.match(regExp);

    if (match && match[2].length == 11) {
        return match[2];
    } else {
        return 'error';
    }
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        $('.movie-poster')
            .attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

function editAddGenreButton(params) {
    let genre = prompt("New genre: ", "");

    if (genre != null) {
        console.log("awda");
        let addGenreContainer = $('.add-new-genre-container');
        console.log(addGenreContainer);
        let div = document.createElement('div');
        div.className = "movie-genre";
        let a = document.createElement('a');
        div.appendChild(a);
        a.innerHTML = genre;
        a.href = "#";
        a.setAttribute('selected', false);

        a.addEventListener("click", function () {
            let value = a.getAttribute("selected");
            if(value === "true"){
                a.setAttribute("selected", false);
                a.style.backgroundColor = "";

                selectedGenres = selectedGenres.filter(function (item) {
                    return item != a.innerHTML;
                });

            } else if(value === "false"){
                a.setAttribute("selected", true);
                a.style.backgroundColor = "red";

                selectedGenres.push(a.innerHTML);

            }
        });

        addGenreContainer.before(div);
    }
}


function addLink(params){

    let div = document.createElement("div");
    div.className = "links-input-container";

    let input = document.createElement("input");
    input.type = "text";
    input.className = "link-input";
    input.value = $('#add-link-input').val();
    $('#add-link-input').val("");
    downloadLinks.push(input.value);

    div.appendChild(input);

    let button = document.createElement("button");
    button.innerText = "Remove Link";
    button.className = "link-button";
    button.addEventListener("click", removeLink);
    div.appendChild(button);

    $('.links-container').append(div);
}

function removeLink(params){
    let val = this.previousSibling.value;
    downloadLinks = downloadLinks.filter(function (item) {
        return item != val;
    });
    this.parentNode.remove();
}

function addMovie(params) {
    $("input[name='title']").val($("#title").text());
    $("input[name='description']").val($("#description").text());
    $("input[name='year']").val($("#year").text());
    $("input[name='youtube_link']").val($("#youtube_link").attr("src"));
    $("input[name='genres']").val(JSON.stringify(selectedGenres));
    $("input[name='downloadLinks']").val(JSON.stringify(downloadLinks));

}

async function uploadFile(inp) {
    let formData = new FormData(); 
    formData.append("file", inp.files[0]);
    await fetch('/movies', {
      method: "POST", 
      body: formData
    }); 
    alert('The file has been uploaded successfully.');
}