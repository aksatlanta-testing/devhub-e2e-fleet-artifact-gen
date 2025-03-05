
{{- define "go-echoa7f2de0e-3842-440f-98c6-53e5763f651c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa7f2de0e-3842-440f-98c6-53e5763f651c.fullname" -}}
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


{{- define "go-echoa7f2de0e-3842-440f-98c6-53e5763f651c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa7f2de0e-3842-440f-98c6-53e5763f651c.labels" -}}
helm.sh/chart: {{ include "go-echoa7f2de0e-3842-440f-98c6-53e5763f651c.chart" . }}
{{ include "go-echoa7f2de0e-3842-440f-98c6-53e5763f651c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa7f2de0e-3842-440f-98c6-53e5763f651c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa7f2de0e-3842-440f-98c6-53e5763f651c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}