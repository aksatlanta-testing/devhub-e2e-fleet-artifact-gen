
{{- define "go-echoe90d3c78-3dbe-4da3-8786-27cf9d5508ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe90d3c78-3dbe-4da3-8786-27cf9d5508ce.fullname" -}}
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


{{- define "go-echoe90d3c78-3dbe-4da3-8786-27cf9d5508ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe90d3c78-3dbe-4da3-8786-27cf9d5508ce.labels" -}}
helm.sh/chart: {{ include "go-echoe90d3c78-3dbe-4da3-8786-27cf9d5508ce.chart" . }}
{{ include "go-echoe90d3c78-3dbe-4da3-8786-27cf9d5508ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe90d3c78-3dbe-4da3-8786-27cf9d5508ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe90d3c78-3dbe-4da3-8786-27cf9d5508ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}