@extends('layouts.app')
@section('title')
Danh sách thông tin lưu trú
@endsection
@section('content-wrapper')
@parent
<div class="page-header">
    <h3 class="page-title">@yield('title')</h3>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Dashboar</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thông tin nơi lưu trú</li>
        </ol>
    </nav>
</div>
<div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Thông tin nơi lưu trú</h4>
                </p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"> ID </th>
                            <th class="text-center"> Hình ảnh</th>
                            <th class="text-center"> Tên Lưu Trú </th>
                            <th class="text-center"> Địa Chỉ </th>
                            <th class="text-center"> Thuộc địa danh</th>
                            <th class="text-center"> Trạng thái </th>
                            <th class="text-center"> Chức năng </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($lstLuuTru as $luutru)
                        <tr>
                            <td class="text-center">{{$luutru->id}}</td>
                            <td class="py-1">
                                <img src="{{$luutru->hinhanh}}" alt="image"
                                    style="width:50px; max-height:200px;object-fit:contain;" />
                            </td>
                            <td class="text-center">{{$luutru->ten}}</td>
                            <td>
                                <div style="width: 300px;
                                    white-space: normal;">{{$luutru->diachi}}</div>
                            </td>
                            <td class="text-center">@foreach ($diaDanh as $item)
                                {{$item->tendiadanh}}
                                @endforeach</td>
                            <td class="text-center">
                                @if ($luutru->trangthai==1)
                                <span class="badge bg-success text-white">Tồn tại</span>
                                @endif
                                @if ($luutru->trangthai==0)
                                <span class="badge bg-danger text-white">Đã xóa</span>
                                @endif
                                @if ($luutru->trangthai==2)
                                <span class="badge bg-warining text-white">Đang xử lí</span>
                                @endif
                            </td>
                            <td class="text-center">
                                <a type="button" class="btn btn-outline-warning"
                                    href="{{route('luutru.show',['luutru'=>$luutru])}}">chi
                                    tiết</a>
                                <a type="button" class="btn btn-outline-success"
                                    href="{{route('luutru.edit',['luutru'=>$luutru])}}">Sửa</a>
                            </td>
                            <td class="text-center">
                                <form method="POST" action="{{route('luutru.destroy',['luutru'=>$luutru])}}">
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