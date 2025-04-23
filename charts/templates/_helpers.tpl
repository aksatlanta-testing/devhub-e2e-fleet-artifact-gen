
{{- define "go-echo71ba1c30-5ec5-49a2-88ba-4fb2e1f85eef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71ba1c30-5ec5-49a2-88ba-4fb2e1f85eef.fullname" -}}
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


{{- define "go-echo71ba1c30-5ec5-49a2-88ba-4fb2e1f85eef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo71ba1c30-5ec5-49a2-88ba-4fb2e1f85eef.labels" -}}
helm.sh/chart: {{ include "go-echo71ba1c30-5ec5-49a2-88ba-4fb2e1f85eef.chart" . }}
{{ include "go-echo71ba1c30-5ec5-49a2-88ba-4fb2e1f85eef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo71ba1c30-5ec5-49a2-88ba-4fb2e1f85eef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo71ba1c30-5ec5-49a2-88ba-4fb2e1f85eef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}