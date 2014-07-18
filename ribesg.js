var _ = jQuery.noConflict(true);

var path = 'http://ci.ribesg.fr/job/JenkRib-theme/lastSuccessfulBuild/artifact/images/';

var replacements = {
   "plugin/jobConfigHistory/img/confighistory.png": "settings.png",
   "images/24x24/edit-delete.png": "cancel.png"
};

var main = function() {
   var regex = /\/static\/.+?\/(.+)/;

   _('img').each(function(i, img) {

      var src = _(img).attr('src');
      console.log("Found img: " + src);

      var regexExec = regex.exec(src);
      var foundPath;
      if (regexExec != null) {
         foundPath = regexExec[1];
         console.log("\tExtracted subPath from src: " + foundPath);
      } else {
         foundPath = src;
      }

      var replacement = replacements[foundPath];
      if (replacement != null) {
         console.log("\tFound replacement: " + replacement);
         _(img).attr(path + replacement);
      } else {
         console.log("\tNo replacement found");
      }
   });
};

_(document).ready(function() {
   main();
});
