
{{- define "go-echo81e4e19b-dee6-425e-a895-6492a12a54ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo81e4e19b-dee6-425e-a895-6492a12a54ff.fullname" -}}
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


{{- define "go-echo81e4e19b-dee6-425e-a895-6492a12a54ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo81e4e19b-dee6-425e-a895-6492a12a54ff.labels" -}}
helm.sh/chart: {{ include "go-echo81e4e19b-dee6-425e-a895-6492a12a54ff.chart" . }}
{{ include "go-echo81e4e19b-dee6-425e-a895-6492a12a54ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo81e4e19b-dee6-425e-a895-6492a12a54ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo81e4e19b-dee6-425e-a895-6492a12a54ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}