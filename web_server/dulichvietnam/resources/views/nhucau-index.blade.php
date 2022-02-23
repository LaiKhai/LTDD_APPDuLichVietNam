@extends('layouts.app')
@section('title')
Danh sách nhu cầu
@endsection
@section('content-wrapper')
@parent
{{--------------------------------------------- Thêm Vùng miền ------------------------------------}}
<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Thêm vùng miền mới</h4>
            <p class="card-description"> Hãy thêm vùng miền mà bạn mong muốn thêm vào danh sách !</p>
            <form class="forms-sample" method="POST" action="{{route('nhucau.store')}}" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="exampleInputName1">Tên nhu cầu</label>
                    <input name="tennhucau" type="text" class="form-control" id="exampleInputName1"
                        placeholder="Tên nhu cầu"> <br>
                    @if ($errors->has('tennhucau'))
                    <small style="color:red">{{$errors->first('tennhucau')}}</small> <br>
                    @endif
                </div>
                <div class="form-group">
                    <label>Hình ảnh</label>
                    <div class="input-group col-xs-12">
                        <input type="file" id="full_hinhanh" name="hinhanh" accept="image/*"
                            class="form-control file-upload-info" placeholder="Upload Image">
                    </div>
                    @if ($errors->has('hinhanh'))
                    <small style="color:red">{{$errors->first('hinhanh')}}</small> <br>
                    @endif
                </div>
                <div class="form-group">
                    <img id="Hinh" src="{{asset('admin_view/assets/images/No_Image.png')}}" alt=""
                        style="width:300px; max-height:200px;object-fit:contain;">
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
            <li class="breadcrumb-item active" aria-current="page">@yield('title')</li>
        </ol>
    </nav>
</div>
<div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">@yield('title')</h4>
                </p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"> ID </th>
                            <th class="text-center"> Tên </th>
                            <th class="text-center"> Hình ảnh </th>
                            <th class="text-center"> trạng thái </th>
                            <th class="text-center"> Chức năng </th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($lstnhucau as $item)
                        <tr>
                            <td>{{$item->id}}</td>
                            <td>{{$item->tennhucau}}</td>
                            <td>
                                <img src="{{$item->hinhanh}}" alt="image"
                                    style="width:50px; max-height:200px;object-fit:contain;" />
                            </td>
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
                                    href="{{route('nhucau.show',['nhucau'=>$item])}}">chi
                                    tiết</a>
                                <a type="button" class="btn btn-outline-success"
                                    href="{{route('nhucau.edit',['nhucau'=>$item])}}">Sửa</a>
                            </td>
                            <td>
                                <form method="POST" action="{{route('nhucau.destroy',['nhucau'=>$item])}}">
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
@endsection
@section('Script')
<script>
    $('#full_hinhanh').change(function()
    {
    previewFile(this,'#Hinh');
    }
    );
    function previewFile(input, imgID) {
        var file = input.files[0];
        
        if (file) {
        var reader = new FileReader();
        
        reader.onload = function () {
        $(imgID).attr("src", reader.result);
        }
        
        reader.readAsDataURL(file);
        }
        }
</script>
@endsection