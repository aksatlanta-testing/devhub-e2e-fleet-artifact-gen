
{{- define "go-echo62f4d29e-82ff-40f7-8a46-b7e5552300ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62f4d29e-82ff-40f7-8a46-b7e5552300ff.fullname" -}}
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


{{- define "go-echo62f4d29e-82ff-40f7-8a46-b7e5552300ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo62f4d29e-82ff-40f7-8a46-b7e5552300ff.labels" -}}
helm.sh/chart: {{ include "go-echo62f4d29e-82ff-40f7-8a46-b7e5552300ff.chart" . }}
{{ include "go-echo62f4d29e-82ff-40f7-8a46-b7e5552300ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo62f4d29e-82ff-40f7-8a46-b7e5552300ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo62f4d29e-82ff-40f7-8a46-b7e5552300ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}