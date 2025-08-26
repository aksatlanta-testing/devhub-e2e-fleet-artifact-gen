
{{- define "go-echo95343e22-5d3f-4c55-8d26-f9b27678962b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95343e22-5d3f-4c55-8d26-f9b27678962b.fullname" -}}
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


{{- define "go-echo95343e22-5d3f-4c55-8d26-f9b27678962b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo95343e22-5d3f-4c55-8d26-f9b27678962b.labels" -}}
helm.sh/chart: {{ include "go-echo95343e22-5d3f-4c55-8d26-f9b27678962b.chart" . }}
{{ include "go-echo95343e22-5d3f-4c55-8d26-f9b27678962b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo95343e22-5d3f-4c55-8d26-f9b27678962b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo95343e22-5d3f-4c55-8d26-f9b27678962b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}