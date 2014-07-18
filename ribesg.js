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
      var subPath = regexExec[1];
      console.log("Extracted subPath from src: " + subPath);

      var replacement = replacements[subPath];
      console.log("Found replacement: " + replacement);

      _(img).attr(path + replacement);
   });
};

_(document).ready(function() {
   main();
});
