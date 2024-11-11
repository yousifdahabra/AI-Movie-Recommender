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
    return post_method.data;
  } catch (error) {
    return [];
  }
};
const update_table = async  () =>{
    const users = await get_users() ;
    await update_table_wait(users)
}

const update_table_wait = (users) =>{
    if(users.states == 0){
      table_body.innerHTML = `<td colspan="7">No data</td>`
      return
    }
    let body = ``;
    users.forEach((user, index) => {
      body+=`
      <tr>
          <td>${user.full_name}</td>
          <td>${user.username } $</td>
          <td>0</td>
          <td>${user.is_active}</td>
          <td>${user.role}</td>
          <td>${user.create_date}</td>
          <td>
              <button data-id="${user.user_id }" class="banned-btn view"  >set it banned</button>
          </td>
      </tr>
      `;

    })
}