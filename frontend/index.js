import { backend } from 'declarations/backend';

async function loadJobs() {
  const jobs = await backend.getJobs();
  const jobList = document.getElementById('job-list');
  jobs.forEach(job => {
    const li = document.createElement('li');
    li.textContent = job;
    jobList.appendChild(li);
  });
}

async function loadPosts() {
  const posts = await backend.getPosts();
  const postsContainer = document.getElementById('posts-container');
  postsContainer.innerHTML = '';
  posts.forEach(post => {
    const article = document.createElement('article');
    article.innerHTML = `
      <h3>${post.title}</h3>
      <p>${post.content}</p>
      <small>Posted on: ${new Date(Number(post.timestamp) / 1000000).toLocaleString()}</small>
    `;
    postsContainer.appendChild(article);
  });
}

async function createPost(event) {
  event.preventDefault();
  const title = document.getElementById('post-title').value;
  const content = document.getElementById('post-content').value;
  await backend.createPost(title, content);
  document.getElementById('post-form').reset();
  await loadPosts();
}

document.addEventListener('DOMContentLoaded', () => {
  loadJobs();
  loadPosts();
  document.getElementById('post-form').addEventListener('submit', createPost);
});
