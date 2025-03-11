
{{- define "go-echoe103ace3-0487-4c01-9669-818b6b0de69a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe103ace3-0487-4c01-9669-818b6b0de69a.fullname" -}}
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


{{- define "go-echoe103ace3-0487-4c01-9669-818b6b0de69a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe103ace3-0487-4c01-9669-818b6b0de69a.labels" -}}
helm.sh/chart: {{ include "go-echoe103ace3-0487-4c01-9669-818b6b0de69a.chart" . }}
{{ include "go-echoe103ace3-0487-4c01-9669-818b6b0de69a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe103ace3-0487-4c01-9669-818b6b0de69a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe103ace3-0487-4c01-9669-818b6b0de69a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}