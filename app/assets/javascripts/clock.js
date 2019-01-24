'use strict';

var time;
      var hour = document.getElementById("hour");
      var minute = document.getElementById("minute");
      var second = document.getElementById("second");

      function main() {
        time = new Date();

        hour.style.transform = "rotate("+(time.getHours()*30+time.getMinutes()*0.5)+"deg)";
        minute.style.transform = "rotate("+(time.getMinutes()*6)+"deg)";
        second.style.transform = "rotate("+(time.getSeconds()*6)+"deg)";

        setTimeout(main, 1000-time.getMilliseconds());
      }

      main();