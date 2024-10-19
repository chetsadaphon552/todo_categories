document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.delete-task').forEach(link => {
      link.addEventListener('click', event => {
        event.preventDefault(); // ป้องกันไม่ให้ไปที่ URL โดยตรง
  
        if (confirm("คุณแน่ใจว่าต้องการลบงานนี้?")) {
          fetch(link.href, {
            method: 'DELETE',
            headers: {
              'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            }
          })
          .then(response => {
            if (response.ok) {
              // ถ้าลบสำเร็จ ให้ลบรายการงานใน UI
              link.closest('li').remove(); // ลบ <li> ที่มีงานนั้น
            } else {
              alert("ไม่สามารถลบงานได้");
            }
          })
          .catch(error => {
            console.error('Error:', error);
          });
        }
      });
    });
  });
  