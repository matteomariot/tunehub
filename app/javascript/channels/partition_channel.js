import consumer from "./consumer";

const initPartitionCable = () => {
  const commentsContainer = document.getElementById('comments');
  const commentsScrollContainer = document.getElementById('comments-scroll');
  if (commentsContainer) {
    const id = commentsContainer.dataset.partitionId;

    consumer.subscriptions.create({ channel: "PartitionChannel", id: id }, {
      received(data) {
        commentsContainer.insertAdjacentHTML('beforeend', data);
        commentsScrollContainer.scrollTop = commentsContainer.offsetHeight;
      },
    });
  }
}

const initScroll = () => {
  const box = document.getElementById('comments-scroll');
  box.scrollTop = box.offsetHeight;
}

export { initPartitionCable };
export { initScroll };
