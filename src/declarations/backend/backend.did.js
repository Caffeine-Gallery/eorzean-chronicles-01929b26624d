export const idlFactory = ({ IDL }) => {
  const Job = IDL.Record({
    'name' : IDL.Text,
    'role' : IDL.Text,
    'description' : IDL.Text,
  });
  const BlogPost = IDL.Record({
    'id' : IDL.Nat,
    'title' : IDL.Text,
    'content' : IDL.Text,
    'timestamp' : IDL.Int,
  });
  return IDL.Service({
    'createPost' : IDL.Func([IDL.Text, IDL.Text], [IDL.Nat], []),
    'getJobs' : IDL.Func([], [IDL.Vec(Job)], ['query']),
    'getPosts' : IDL.Func([], [IDL.Vec(BlogPost)], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
