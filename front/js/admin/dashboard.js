const table_body = document.getElementById("table_body");

const get_users = async () => {
  try {
    const post_method = await axios({
      method: "post",
      url: "#",
      data: {
        get_users: "true",
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    });
    return post_method.data;
  } catch (error) {
    return [];
  }
};
