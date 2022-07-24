let selectedGenres = [];
let search_bar;

let movieCount;
let currentPage = 1;
let moviesPerPage_desktop = 5;
let moviesPerPage_mobile = 8;
let moviesPerPage = 8;
let pagesCount = 1;

$(document).ready(function(){
    /*
    $("#ajaxdata").load("allRecords.php");
    $("#genre-filter").change(function(){
        var selected=$(this).val();
        var arr = [];
        arr.push(selected);

        if(arr[0] == "all"){
            $("#ajaxdata").load("allRecords.php");
        } else
            $("#ajaxdata").load("search.php",{selected_genre: JSON.stringify(arr)});
    });
    $("#refresh").click(function(){
        $("#ajaxdata").load("allRecords.php");
    });
    */
    if (window.innerWidth >= 1150) {
        moviesPerPage = moviesPerPage_desktop;
        if(currentPage > pagesCount)
            currentPage = pagesCount;
    } else {
        moviesPerPage = moviesPerPage_mobile;
        if(currentPage > pagesCount)
            currentPage = pagesCount;
    }

    search_bar = document.getElementById("movie-search-bar");
    search_bar.addEventListener("keyup", refreshData);

    var objects = $(".movie-genre");
    for (let genre of objects) {
        genre.addEventListener("click", function () {
            let value = genre.getAttribute("selected");
            if(value === "true"){
                genre.setAttribute("selected", false);
                genre.style.backgroundColor = "#000";

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

    let prevPageButton = $(".prev-page-button")[0].onclick = () => {
        if(currentPage>1){
            currentPage--; 
            setUpPages();
        }
    };
    let nextPageButton = $(".next-page-button")[0].onclick = () => {
        if(currentPage<pagesCount) {
            currentPage++; 
            setUpPages();
        }
    };
    
});

function setUpPages(){
    let div = document.getElementById("pages");
    while (div.firstChild) {
        div.removeChild(div.lastChild);
    }

    let c = 0;
    for (let index = currentPage-3; index < currentPage+4; index++) {
        if(index >= 0 && index < pagesCount){
            let h3 = document.createElement("h3");
            h3.innerText = index + 1;
            h3.onclick = newPage;
            if(index+1 === currentPage)
                h3.className = "current-page";
            div.appendChild(h3);
            
            c++;
            if(c >= 5)
                break;
        }
    }
}

function newPage(event){
    currentPage = parseInt(this.innerText);
    setUpPages();
}


window.addEventListener('resize', function(event) {
    if (window.innerWidth >= 1150) {
        moviesPerPage = moviesPerPage_desktop;
        if(currentPage > pagesCount)
            currentPage = pagesCount;
    } else {
        moviesPerPage = moviesPerPage_mobile;
        if(currentPage > pagesCount)
            currentPage = pagesCount;
    }
}, true);
