const table_body = document.getElementById("table_body");

const get_users = async () => {
  try {
    const post_method = await axios({
      method: "post",
      url: "../../../server/admin/dashboard.php",
      data: {
        get_users: "true",
      },
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    });
    console.log(post_method)
    return post_method.data;
  } catch (error) {
    return [];
  }
};
get_users()