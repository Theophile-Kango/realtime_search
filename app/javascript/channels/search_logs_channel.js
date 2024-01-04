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
    const { articles, query } = data;
    const remoteArticles = document.querySelector("#remote_articles");
  
    remoteArticles.innerHTML = articles.map(article => {
      return `
        <div class="col-md-3 mb-3">
          <div class="card" style="">
            <img src="${article.urlToImage}" class="card-img-top" alt="${article.title}">
            <div class="card-body">
              <h5 class="card-title">${article.title}</h5>
              <p class="card-text">${article.description}</p>
              <a href="${article.url}" class="btn btn-primary" target="_blank">Read more...</a>
            </div>
          </div>
        </div>
      `;
    }).join('');

    // fetch('/update_search', {
    //   method: 'POST',
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
    //   },
    //   body: JSON.stringify({ query }),
    // })
  }
});
