
{{- define "go-echof499bb7b-b802-467a-8aca-ff87352081a4.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof499bb7b-b802-467a-8aca-ff87352081a4.fullname" -}}
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


{{- define "go-echof499bb7b-b802-467a-8aca-ff87352081a4.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof499bb7b-b802-467a-8aca-ff87352081a4.labels" -}}
helm.sh/chart: {{ include "go-echof499bb7b-b802-467a-8aca-ff87352081a4.chart" . }}
{{ include "go-echof499bb7b-b802-467a-8aca-ff87352081a4.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof499bb7b-b802-467a-8aca-ff87352081a4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof499bb7b-b802-467a-8aca-ff87352081a4.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}