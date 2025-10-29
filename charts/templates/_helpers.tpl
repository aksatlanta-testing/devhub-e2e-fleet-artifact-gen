
{{- define "go-echoc3032950-d8d9-4280-853a-35b964c25b06.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc3032950-d8d9-4280-853a-35b964c25b06.fullname" -}}
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


{{- define "go-echoc3032950-d8d9-4280-853a-35b964c25b06.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc3032950-d8d9-4280-853a-35b964c25b06.labels" -}}
helm.sh/chart: {{ include "go-echoc3032950-d8d9-4280-853a-35b964c25b06.chart" . }}
{{ include "go-echoc3032950-d8d9-4280-853a-35b964c25b06.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc3032950-d8d9-4280-853a-35b964c25b06.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc3032950-d8d9-4280-853a-35b964c25b06.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}