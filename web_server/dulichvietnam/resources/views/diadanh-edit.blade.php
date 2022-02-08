@extends('layouts.app')
@section('title')
Chỉnh sửa địa danh
@endsection
@section('content-wrapper')
@parent
<div class="col-md-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Chỉnh địa danh</h4>
            @foreach ($lstdiadanh as $item)
            <form class="forms-sample" method="post" action="{{route('diadanh.update',['diadanh'=>$item])}}"
                enctype="multipart/form-data">
                @csrf
                @method('PATCH')
                <div class="form-group row">
                    <label for="exampleInputUsername2" class="col-sm-3 col-form-label">ID</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="id" id="exampleInputUsername2"
                            value="{{$item->id}}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Tên địa danh</label>
                    <div class="col-sm-9">
                        <input type="text" name="tendiadanh" class="form-control" id="exampleInputEmail2"
                            value="{{$item->tendiadanh}}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Mô tả</label>
                    <div class="col-sm-9">
                        <textarea row="10" class="form-control" id="exampleInputMobile"
                            name="mota">{{$item->mota}}</textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputPassword2" class="col-sm-3 col-form-label">ID Vùng Miền</label>
                    <div class="col-sm-9">
                        <input type="text" name="vung_miens_id" class="form-control" id="exampleInputPassword2"
                            value="{{$item->vung_miens_id}}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Kinh độ</label>
                    <div class="col-sm-9">
                        <input type="text" name="kinhdo" class="form-control" id="exampleInputEmail2"
                            value="{{$item->kinhdo}}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Vĩ độ</label>
                    <div class="col-sm-9">
                        <input type="text" name="vido" class="form-control" id="exampleInputEmail2"
                            value="{{$item->vido}}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Trạng Thái</label>
                    <div class="col-sm-3">
                        <input type="checkbox" name="trangthai" class="form-check-input pl-2" value="1"
                            {{$item->trangthai=='1'?'checked':''}}> <span class="badge bg-success text-white">Tồn
                            tại</span>
                    </div>
                    <div class="col-sm-3">
                        <input type="checkbox" name="trangthai" class="form-check-input pl-2" value="2"
                            {{$item->trangthai=='2'?'checked':''}}> <span
                            class="badge bg-warning text-white text-white"> Chờ duyệt</span>
                    </div>
                    <div class="col-sm-3">
                        <input type="checkbox" name="trangthai" class="form-check-input pl-2" value="3"
                            {{$item->trangthai=='2'?'checked':''}}> <span
                            class="badge bg-danger text-white text-white">Đã duyệt</span>
                    </div>
                </div>
                @endforeach
                <button type="submit" class="btn btn-success mr-2">Sửa</button>
                <a type="button" class="btn btn-outline-primary" href="{{route('diadanh.index')}}">Quay lại</a>
            </form>
        </div>
    </div>
</div>
@endsection