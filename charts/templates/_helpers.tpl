
{{- define "go-echo030096b0-c5c3-46d4-876f-3283c080bbf9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo030096b0-c5c3-46d4-876f-3283c080bbf9.fullname" -}}
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


{{- define "go-echo030096b0-c5c3-46d4-876f-3283c080bbf9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo030096b0-c5c3-46d4-876f-3283c080bbf9.labels" -}}
helm.sh/chart: {{ include "go-echo030096b0-c5c3-46d4-876f-3283c080bbf9.chart" . }}
{{ include "go-echo030096b0-c5c3-46d4-876f-3283c080bbf9.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo030096b0-c5c3-46d4-876f-3283c080bbf9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo030096b0-c5c3-46d4-876f-3283c080bbf9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}