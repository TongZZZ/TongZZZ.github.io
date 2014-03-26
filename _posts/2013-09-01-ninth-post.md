---
layout: post_page
title: Samuel L
---
<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
$(function() {
    var $text       = $("#text"), 
        $preview    = $("#preview");
        $text.on("keyup", function() {
        $preview.html( marked($text.val()) );
        MathJax.Hub.Queue(["Typeset", MathJax.Hub, "preview"]);
    })
});
