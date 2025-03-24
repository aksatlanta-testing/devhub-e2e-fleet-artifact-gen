
{{- define "go-echod5ce7dd7-fff7-4bb2-a6f5-991cc926a55f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5ce7dd7-fff7-4bb2-a6f5-991cc926a55f.fullname" -}}
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


{{- define "go-echod5ce7dd7-fff7-4bb2-a6f5-991cc926a55f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod5ce7dd7-fff7-4bb2-a6f5-991cc926a55f.labels" -}}
helm.sh/chart: {{ include "go-echod5ce7dd7-fff7-4bb2-a6f5-991cc926a55f.chart" . }}
{{ include "go-echod5ce7dd7-fff7-4bb2-a6f5-991cc926a55f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod5ce7dd7-fff7-4bb2-a6f5-991cc926a55f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod5ce7dd7-fff7-4bb2-a6f5-991cc926a55f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}