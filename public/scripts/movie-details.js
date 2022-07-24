let limit = 1;
let movieID, comment, email;
let ajaxData;

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

    movieID = $('.movie-reviews-section').attr('movieID');

    console.log("awdawdaw");
    document.getElementsByClassName("add-new-review-button")[0].addEventListener("click", addNewReview);
});


function addNewReview(params) {
    comment = $('.comment').val();
    let val = "fromForm";
    if(comment.length > 15){
        $("#ajaxdata").load("addNewReview.php", {movieID: movieID, comment: comment, limit: limit, rating:5, val:val});
        $('.comment').val('');
    }
}