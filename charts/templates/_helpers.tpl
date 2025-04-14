
{{- define "go-echoe8417c31-cce2-4043-9df4-0fa7f817b717.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8417c31-cce2-4043-9df4-0fa7f817b717.fullname" -}}
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


{{- define "go-echoe8417c31-cce2-4043-9df4-0fa7f817b717.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe8417c31-cce2-4043-9df4-0fa7f817b717.labels" -}}
helm.sh/chart: {{ include "go-echoe8417c31-cce2-4043-9df4-0fa7f817b717.chart" . }}
{{ include "go-echoe8417c31-cce2-4043-9df4-0fa7f817b717.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe8417c31-cce2-4043-9df4-0fa7f817b717.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe8417c31-cce2-4043-9df4-0fa7f817b717.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}