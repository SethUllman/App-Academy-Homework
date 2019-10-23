const FollowToggle = require("./follow_toggle.js");

$( () => {
  $(".follow-toggle").each( (idx, el) => {
    new FollowToggle(el);
  });
});
