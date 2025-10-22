
{{- define "go-echo75fd0506-7228-4e16-94a1-c3c4f0d0e886.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo75fd0506-7228-4e16-94a1-c3c4f0d0e886.fullname" -}}
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


{{- define "go-echo75fd0506-7228-4e16-94a1-c3c4f0d0e886.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo75fd0506-7228-4e16-94a1-c3c4f0d0e886.labels" -}}
helm.sh/chart: {{ include "go-echo75fd0506-7228-4e16-94a1-c3c4f0d0e886.chart" . }}
{{ include "go-echo75fd0506-7228-4e16-94a1-c3c4f0d0e886.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo75fd0506-7228-4e16-94a1-c3c4f0d0e886.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo75fd0506-7228-4e16-94a1-c3c4f0d0e886.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}