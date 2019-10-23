class FollowToggle {

  constructor (el) {
    this.$el = $(el);
    this.userId = this.$el.data( "user-id" );
    this.followState = this.$el.data( "initial-follow-state" );
    
    this.render();
    this.handleClick();
  }

  render() {
    if (this.followState === 'unfollow') {
      this.$el.text("Follow!");
      this.$el.prop('disabled', false);
    } else if (this.followState === 'follow') {
      this.$el.text("Followed");
      this.$el.prop('disabled', false);
    } else {
      this.$el.text("...");
      this.$el.prop('disabled', true);
    }
  }

  handleClick() {
    this.$el.on("click", (event) => {
      event.preventDefault();
      if (!this.followState) {
        $.ajax({
          url: `/users/${this.userId}/follow`,
          method: 'POST',
          dataType: 'json',
          success: () => {
            this.followState = 'follow';
            this.render();
            console.log("success!");
          },
          error: () => { 
            console.log("error!");
            console.log(this.userId);
            console.log(this.followState);
          }
        });
      } else {
        $.ajax({
          url: `/users/${this.userId}/follow`,
          method: 'DELETE',
          dataType: 'json',
          success: () => {
            this.followState = false;
            this.render();
          }
        })
      }
    })
  }
  // $.ajax({
  //   url: '/widgets.json',
  //   type: 'POST',
  //   data: {
  //     widget: {
  //       name: 'The Best Widget',
  //       maker: 'The Widget King'
  //   }
  //   },

}

module.exports = FollowToggle;