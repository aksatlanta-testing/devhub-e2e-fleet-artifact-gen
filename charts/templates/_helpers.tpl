
{{- define "go-echod0a128d9-a785-480c-ba51-39756885fec0.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0a128d9-a785-480c-ba51-39756885fec0.fullname" -}}
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


{{- define "go-echod0a128d9-a785-480c-ba51-39756885fec0.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0a128d9-a785-480c-ba51-39756885fec0.labels" -}}
helm.sh/chart: {{ include "go-echod0a128d9-a785-480c-ba51-39756885fec0.chart" . }}
{{ include "go-echod0a128d9-a785-480c-ba51-39756885fec0.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod0a128d9-a785-480c-ba51-39756885fec0.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod0a128d9-a785-480c-ba51-39756885fec0.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}