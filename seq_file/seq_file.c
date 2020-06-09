#include <linux/module.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>



#define PROC_NAME     "umap/seqfile"

int seq_file_show(struct seq_file *sfile, void *data)
{
	int i;
	for(i = 0; i < 500; i++)
		seq_printf(sfile, "i[%d]0123456789\n", i);
	return 0;
}


static int seq_file_open(struct inode *node, struct file *fp)
{
	return single_open(fp, seq_file_show, NULL);
}


static struct file_operations seqfile_fops = {
	.owner = THIS_MODULE,
	.open = seq_file_open,
	.read = seq_read,
	.release = seq_release,
};


static __init int seq_file_init(void)

{
	struct proc_dir_entry *p;
	p = proc_create(PROC_NAME, 0444, NULL, &seqfile_fops); 
	if (!p){
		printk(KERN_ERR "vb: create vb proc fail!\n");
		return -1;
	}    
	return 0;
}

static __exit void seq_file_exit(void)
{
	remove_proc_entry(PROC_NAME, NULL);
}

module_init(seq_file_init);
module_exit(seq_file_exit);
