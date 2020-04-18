<div class="card-header">
    <ul class="nav nav-pills nav-secondary">
        <li class="nav-item">
            <a class="nav-link <?=METHOD=='manager'?'table-active':''?>" href="<?=url('manager')?>" ><i class="icon-list"></i> 管理</a>
        </li>
        <li class="nav-item">
            <a class="nav-link <?=(METHOD=='add')?'table-active':''?>" href="<?=url('add')?>" ><i class="icon-note"></i> 新增</a>
        </li>
    </ul>
</div>