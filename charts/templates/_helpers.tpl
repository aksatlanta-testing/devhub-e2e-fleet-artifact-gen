
{{- define "go-echo5990e9a5-5462-4be8-a591-9e1cacfb94cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5990e9a5-5462-4be8-a591-9e1cacfb94cc.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo5990e9a5-5462-4be8-a591-9e1cacfb94cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo5990e9a5-5462-4be8-a591-9e1cacfb94cc.labels" -}}
helm.sh/chart: {{ include "go-echo5990e9a5-5462-4be8-a591-9e1cacfb94cc.chart" . }}
{{ include "go-echo5990e9a5-5462-4be8-a591-9e1cacfb94cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo5990e9a5-5462-4be8-a591-9e1cacfb94cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo5990e9a5-5462-4be8-a591-9e1cacfb94cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}