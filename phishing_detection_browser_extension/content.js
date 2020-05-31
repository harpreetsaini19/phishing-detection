var url = document.location.origin;
console.log(url)

$.ajax({
  method: "POST",
  url: 'http://localhost:4567/is_phish_url',
  data: {url: url},
  dataType: "json",
  success: function(res){
    console.log(res)
    if(res.result) {
      alert("Is phishing website");
    }
  }
})
