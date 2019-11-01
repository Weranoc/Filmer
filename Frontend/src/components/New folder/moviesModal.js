   function ticketModal() {
        var x = document.getElementById("msg");
        x.className = "show";
        setTimeout(function() {x.className = x.className.replace("show", ""); }, 3000);
                        }

   function infoFunction() {
         var popup = document.getElementById("myInfo");
         popup.classList.toggle("show");
                            }

   function storyFunction() {
         var popup = document.getElementById("myStory");
         popup.classList.toggle("show");
                           }
         
   function daysFunction() {
         var popup = document.getElementById("myDays");
         popup.classList.toggle("show");
                           }

   function astraFunction() {
         var popup = document.getElementById("myAstra");
         popup.classList.toggle("show");
                            }