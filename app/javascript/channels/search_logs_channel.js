import CableReady from "cable_ready";
import consumer from "./consumer";

consumer.subscriptions.create("SearchLogsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if(data.turbo_stream){
      CableReady.perform(data.turbo_stream);
    }
  }
});
