@extends('layouts.app')
@section('title')
Danh sách thông tin Địa Danh
@endsection
@section('content-wrapper')
@parent
{{--------------------------------------------- Thêm Vùng miền ------------------------------------}}
<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Thêm vùng miền mới</h4>
            <p class="card-description"> Hãy thêm vùng miền mà bạn mong muốn thêm vào danh sách !</p>
            <form class="forms-sample" method="POST" action="{{route('vungmien.store')}}" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="exampleInputName1">Tên Vùng Miền</label>
                    <input name="tenvungmien" type="text" class="form-control" id="exampleInputName1"
                        placeholder="Tên vùng miền"> <br>
                    @if ($errors->has('tenvungmien'))
                    <small style="color:red">{{$errors->first('tenvungmien')}}</small> <br>
                    @endif
                </div>
                <div class="form-check form-check-flat form-check-primary">
                    <label class="form-check-label" for="trangthai">
                        <input type="checkbox" class="form-check-input" name="trangthai" value=1>Trạng thái</label>
                </div>
                <button type="submit" class="btn btn-primary mr-2">Thêm</button>
            </form>
        </div>
    </div>
</div>
{{----------------------------------------------- Thêm Vùng miền - End ----------------------------------------}}

{{------------------------------------------------ Danh sách địa danh ----------------------------------------}}
<div class="page-header">
    <h3 class="page-title">@yield('title')</h3>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Dashboar</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thông tin địa danh</li>
        </ol>
    </nav>
</div>
<div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Thông tin địa danh</h4>
                </p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"> ID </th>
                            <th class="text-center"> Tên </th>
                            <th class="text-center"> Mô tả </th>
                            <th class="text-center"> Tên vùng miền </th>
                            <th class="text-center"> Kinh độ </th>
                            <th class="text-center"> Vĩ độ </th>
                            <th class="text-center"> trạng thái </th>
                            <th class="text-center"> Chức năng </th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($data as $item)
                        <tr>
                            <td>{{$item->id}}</td>
                            <td>{{$item->tendiadanh}}</td>
                            <td>
                                <div style="width: 100px;white-space: normal;">{{$item->mota}}</div>
                            </td>
                            <td>{{$item->tenvungmien}}</td>
                            <td>{{$item->kinhdo}}</td>
                            <td>{{$item->vido}}</td>
                            <td>
                                @if ($item->trangthai==1)
                                <span class="badge bg-success">Tồn tại</span>
                                @endif
                                @if ($item->trangthai==0)
                                <span class="badge bg-danger">Đã xóa</span>
                                @endif
                                @if ($item->trangthai==2)
                                <span class="badge bg-warining">Đang xử lí</span>
                                @endif
                            </td>
                            <td>
                                <a type="button" class="btn btn-outline-warning"
                                    href="{{route('diadanh.show',['diadanh'=>$item])}}">chi
                                    tiết</a>
                                <a type="button" class="btn btn-outline-success"
                                    href="{{route('diadanh.edit',['diadanh'=>$item])}}">Sửa</a>
                            </td>
                            <td>
                                <form method="POST" action="{{route('diadanh.destroy',['diadanh'=>$item])}}">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-outline-danger">Xóa</button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
{{------------------------------------------------ Danh sách địa danh - End ----------------------------------------}}
{{------------------------------------------------ Danh sách Vùng Miền ----------------------------------------}}
<div class="page-header">
    <h3 class="page-title">Quản Lí Vùng Miền</h3>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Dashboar</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thông tin Vùng miền</li>
        </ol>
    </nav>
</div>
<div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Thông tin Vùng miền</h4>
                </p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"> ID </th>
                            <th class="text-center"> Tên Vùng Miền </th>
                            <th class="text-center"> Trạng thái </th>
                            <th class="text-center">Chức Năng</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($lstVungMien as $vungMien)
                        <tr>
                            <td class="text-center">{{$vungMien->id}}</td>
                            <td class="text-center">{{$vungMien->tenvungmien}}</td>
                            <td class="text-center">
                                @if ($vungMien->trangthai==1)
                                <span class="badge bg-success">Tồn tại</span>
                                @endif
                                @if ($vungMien->trangthai==0)
                                <span class="badge bg-danger">Đã xóa</span>
                                @endif
                                @if ($vungMien->trangthai==2)
                                <span class="badge bg-warining">Đang xử lí</span>
                                @endif
                            </td>
                            <td class="text-center">
                                <a type="button" class="btn btn-outline-success"
                                    href="{{route('vungmien.edit',['vungmien'=>$vungMien])}}">Sửa</a>
                            </td>
                            <td class="text-center">
                                <form method="POST" action="{{route('vungmien.destroy',['vungmien'=>$vungMien])}}">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-outline-danger">Xóa</button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection