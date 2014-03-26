---
layout: post_page
title: Samuel L
---
$(function() {
    var $text       = $("#text"), // the markdown textarea
        $preview    = $("#preview"); // the preview div

    $text.on("keyup", function() {
        $preview.html( marked($text.val()) ); // parse markdown
        MathJax.Hub.Queue(["Typeset", MathJax.Hub, "preview"]); // then let MathJax do its job
    })
});
