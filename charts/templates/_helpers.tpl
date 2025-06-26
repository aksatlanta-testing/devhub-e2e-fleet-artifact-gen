
{{- define "go-echobfbed6e9-8ed5-47a1-8a6e-cefa33dda253.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfbed6e9-8ed5-47a1-8a6e-cefa33dda253.fullname" -}}
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


{{- define "go-echobfbed6e9-8ed5-47a1-8a6e-cefa33dda253.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobfbed6e9-8ed5-47a1-8a6e-cefa33dda253.labels" -}}
helm.sh/chart: {{ include "go-echobfbed6e9-8ed5-47a1-8a6e-cefa33dda253.chart" . }}
{{ include "go-echobfbed6e9-8ed5-47a1-8a6e-cefa33dda253.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobfbed6e9-8ed5-47a1-8a6e-cefa33dda253.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobfbed6e9-8ed5-47a1-8a6e-cefa33dda253.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}