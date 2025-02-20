
{{- define "go-echo332b2fb8-9abf-49b4-86c4-d93b34ee76fb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo332b2fb8-9abf-49b4-86c4-d93b34ee76fb.fullname" -}}
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


{{- define "go-echo332b2fb8-9abf-49b4-86c4-d93b34ee76fb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo332b2fb8-9abf-49b4-86c4-d93b34ee76fb.labels" -}}
helm.sh/chart: {{ include "go-echo332b2fb8-9abf-49b4-86c4-d93b34ee76fb.chart" . }}
{{ include "go-echo332b2fb8-9abf-49b4-86c4-d93b34ee76fb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo332b2fb8-9abf-49b4-86c4-d93b34ee76fb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo332b2fb8-9abf-49b4-86c4-d93b34ee76fb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}