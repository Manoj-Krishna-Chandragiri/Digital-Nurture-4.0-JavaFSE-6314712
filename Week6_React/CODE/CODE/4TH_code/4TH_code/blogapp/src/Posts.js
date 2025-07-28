// blogapp/src/Posts.js
import React from 'react';
import Post from './Post'; 

class Posts extends React.Component {  
  constructor(props) { 
    super(props);
    this.state = {
      posts: [], 
      hasError: false, 
      error: null,     
      errorInfo: null  
    };
  }
  loadPosts = async () => {
    try {
      const response = await fetch('https://jsonplaceholder.typicode.com/posts');
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      const loadedPosts = data.map(post => new Post(post.id, post.title, post.body));
      this.setState({ posts: loadedPosts }); 
    } catch (error) {
      console.error("Error loading posts:", error);
    }
  };
 componentDidMount() {
    this.loadPosts(); 
  }
  componentDidCatch(error, info) { 
    console.error("Error caught by componentDidCatch:", error, info);
    this.setState({
      hasError: true,
      error: error,
      errorInfo: info
    });
    alert("An error occurred in the Posts component: " + error.message); 
  }
render() { 
    if (this.state.hasError) {
      return (
        <div>
          <h1>Something went wrong.</h1>
          <details style={{ whiteSpace: 'pre-wrap' }}>
            {this.state.error && this.state.error.toString()}
            <br />
            {this.state.errorInfo.componentStack}
          </details>
        </div>
      );
    }
    return (
      <div>
        <h1>Blog Posts</h1>
        {this.state.posts.length > 0 ? (
          this.state.posts.map(post => (
            <div key={post.id}>
              <h2>{post.title}</h2> { }
              <p>{post.body}</p>    { }
              <hr />
            </div>
          ))
        ) : (
          <p>Loading posts...</p>
        )}
      </div>
    );
  }
}

export default Posts;